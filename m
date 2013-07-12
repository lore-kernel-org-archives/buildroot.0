From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Jul 2013 22:22:55 +0200
Subject: [Buildroot]
 =?utf-8?q?Error_while_installing_dosfstools=3A_mkdosf?=
 =?utf-8?q?s=E2=80=99=3A_No_such_file_or_directory?=
In-Reply-To: <alpine.LSU.2.10.1307111112110.7453@schiller.dip.t-dialin.net>
 (Jens Schleusener's message of "Thu, 11 Jul 2013 11:33:57 +0200
 (CEST)")
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 <87obaciyn8.fsf@dell.be.48ers.dk>
 <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
 <87bo6ci9xk.fsf@dell.be.48ers.dk> <51DD6469.4010504@gmail.com>
 <20130710185808.56c3ac52@skate> <51DD94D9.6060001@zacarias.com.ar>
 <87y59efgfj.fsf@dell.be.48ers.dk>
 <alpine.LSU.2.10.1307111112110.7453@schiller.dip.t-dialin.net>
Message-ID: <87txjzcyu8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jens" == Schleusener, Jens <Jens.Schleusener@t-online.de> writes:

Hi Jens,

 Jens> Hmm, I am the fossies.org admin and I am not really sure what is the
 Jens> right fix respectively fossies.org behaviour.

 Jens> 1) Remark: If you would use the wget option "--content-disposition"
 Jens> you would get after downloading using the URL
 Jens> http://fossies.org/linux/misc/dosfstools-3.0.16.tar.gz according the
 Jens> "301 Moved Permanently"-Location a file named "dosfstools-3.0.20.tar.gz".

 Jens> 2) Changed behaviour: fossies.org now issued a "410 Gone" HTTP status
 Jens> with some information in the HTML code about the reason together with
 Jens> a link to the current (only) available newer version of the requested
 Jens> package tarball.

That's good, thanks a lot.

 Jens> 3) Remark: fossies.org isn't a mirror and is unsuitable for
 Jens> downloading special legacy versions since it tries to offer only
 Jens> "fresh" current versions.

Ok, noted. The dosfstools package has been changed in git to no longer
use fossies.org, so this is just for people using older releases.

-- 
Bye, Peter Korsgaard
