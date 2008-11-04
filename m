From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Nov 2008 09:51:16 +0100
Subject: [Buildroot] openssl extract problem
In-Reply-To: <000001c93de7$a0188130$e0498390$@be> (steve caster's message of
	"Mon\, 3 Nov 2008 20\:08\:58 +0100")
References: <db2a8a5aa9a6e1044ee4fc0ce95602f8@bugs.uclibc.org>
	<000001c93de7$a0188130$e0498390$@be>
Message-ID: <87od0van7f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "steve" == steve caster <steve@c2root.be> writes:

 steve> Hi all,

 steve> I am trying to compile openssl, but it gives me an bzip2 error
 steve> which seems quite normal when trying to bunzip a .gz file. The
 steve> main question is, where can I modify this as I don't see a .mk
 steve> with the bzip command?

I don't see that here:
>>> openssl 0.9.8g Downloading
--09:48:13--  http://www.openssl.org/source/openssl-0.9.8g.tar.gz
           => `/var/lib/downloads/openssl-0.9.8g.tar.gz'

Please provide more details of your .config and exact error message.

-- 
Bye, Peter Korsgaard
