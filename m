From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Sun, 06 Feb 2011 04:18:41 +0000
Subject: [Buildroot] compiling mplayer on mipsel
Message-ID: <1296965921.20053.24.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm using git version and tests are going well..., but I stuck again on
mplayer, well I'm far to play mplayer in my HDD media player but I'd
like try test it.  
I send full log from : 
rm -rf output/build/mplayer-32710/ ; make mplayer >& mplayer.log
to see if you can help out.

Should I file a bug ? 

The compile error is : 
file.c:23:5: warning: "HAVE_MMAP" is not defined                                                                                           
file.c:25:7: warning: "HAVE_MAPVIEWOFFILE" is not defined                                                                                  
file.c: In function 'av_file_map':                                                                                                         
file.c:50: error: 'HAVE_MMAP' undeclared (first use in this function)                                                                      
file.c:50: error: (Each undeclared identifier is reported only once                                                                        
file.c:50: error: for each function it appears in.)                                                                                        
file.c:77:5: warning: "HAVE_MMAP" is not defined                                                                                           
file.c:87:7: warning: "HAVE_MAPVIEWOFFILE" is not defined                                                                                  
file.c:124:5: warning: "HAVE_MMAP" is not defined                                                                                          
file.c:126:7: warning: "HAVE_MAPVIEWOFFILE" is not defined 

Thanks, 
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mplayer.log
Type: text/x-log
Size: 1037857 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110206/cb791c1e/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110206/cb791c1e/attachment-0003.bin>
