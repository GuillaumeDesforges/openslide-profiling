#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <glib.h>
#include <openslide/openslide.h>

int main(int argc, char *argv[]) {
   printf("start\n");
   printf("get path\n");
   assert(argc > 1);
   char *filepath = argv[1];

   printf("open\n");
   openslide_t *osr = openslide_open(filepath);
   
   printf("read region\n");
   const int w = 300, h = 300;
   uint32_t *dest = g_new(uint32_t, w * h * 4);
   assert(osr != NULL && openslide_get_error(osr) == NULL);
   openslide_read_region(osr, dest, 0, 0, 0, w, h);
   assert(openslide_get_error(osr) == NULL);
   
   printf("free region\n");
   g_free(dest);

   printf("close\n");
   openslide_close(osr);

   printf("done\n");
   return 0;
}
