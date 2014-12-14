From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 19:09:14 +0100
Subject: [Buildroot] [PATCH] package/faad2: add hash
In-Reply-To: <XnsA403BE33C127EberndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Sun, 14 Dec 2014 18:41:45 +0100")
References: <1418578396-11893-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA403BE33C127EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87tx0ynlx1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
 > news:1418578396-11893-1-git-send-email-yann.morin.1998 at free.fr:

 >> +++ b/package/faad2/faad2.hash
 >> @@ -0,0 +1,2 @@
 >> +# Locally computed
 >> +sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  
 > faad2-2.7.tar.gz

 > Hi,

 > just a small note because the buildroot doc says hash values provided by 
 > upstream are prefered:

 > Looking at http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.7/ 
 > you can click on the "i" button of faad2-2.7.tar.bz2 to display its md5/sha1 
 > values, they could be added to our hash file instead of a locally computed 
 > hash.

Indeed, similar to how I did it for liblo in b08c503b244d37. Yann, will
you respin the patch?

-- 
Bye, Peter Korsgaard
