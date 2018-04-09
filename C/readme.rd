###write your own strcmp
int ownstrcmp(char a[], char b[])
{
   int i = 0;
   while( a[i] == b[i] )  
   {

      if( a[i] == '\0' ) 
        return 0;
      ++i;
   }
   return  ( a[i] < b[i]) ? 1 : -1;
}

