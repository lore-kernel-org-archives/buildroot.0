From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 May 2015 17:50:06 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505172610.5e76bcb9@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 5 May 2015 17:26:10 +0200")
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <87egmvoxqf.fsf@dell.be.48ers.dk>
 <20150505172610.5e76bcb9@free-electrons.com>
Message-ID: <871tivowgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Tue, 05 May 2015 17:22:32 +0200, Peter Korsgaard wrote:

 >> > Hello,
 >> > Simon, Pascal, Gustavo, Vicente, Max, Samuel, Bernd, look below, there
 >> > are some questions/tasks for you! :-)
 >> 
 >> It would probably have been good to add them in To: then ;)

 > They were in Cc, but this stupid mailing list removes people from the
 > Cc: list when they are subscribed. My initial e-mail headers were:

Ahh, ok.

 > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > To: buildroot at uclibc.org
 > Cc: Simon Dawson <spdawson@gmail.com>, Pascal Huerst
 > <pascal.huerst@gmail.com>, Gustavo Zacarias <gustavo@zacarias.com.ar>,
 > Vicente Olivert Riera <Vincent.Riera@imgtec.com>, Max Filippov
 > <jcmvbkbc@gmail.com>, Samuel Martin <s.martin49@gmail.com>, Bernd
 > Kuhls <berndkuhls@hotmail.com>

 > If the mailing list configuration could be changed to not do this
 > stupid trimming of the Cc addresses, it would be great.

I had a look around, and according to this, it is because these users
have the nodupes option enabled:

https://bugs.launchpad.net/mailman/+bug/1216960

As described below, I have changed the default for new subscribers to
NOT enable this option, but I don't know how to do it in any bulk way
for the current subscribers (and if people want that):

https://www.ietf.org/mail-archive/web/ietf/current/msg37128.html


 >> >> arm | at-3.1.13 | NOK |
 >> >> http://autobuild.buildroot.net/results/6f25e80e8aedec91323ef9b67576b550d7abee60/
 >> 
 >> > musl build problem. Yann has sent a patch to disable at on musl, but I
 >> > would actually prefer to fix at.
 >> 
 >> J?rg mentioned that OE has a patch:
 >> 
 >> http://patchwork.openembedded.org/patch/91893/

 > So let's use it :-)

Yeah, will you send a patch? ;)

 >> > Gustavo, maybe? Has OpenSSL removed md2 support by default or something
 >> > like that?
 >> 
 >> I believe it simply gets confused about something on the build host.

 > Yes, Gustavo has already submitted a patch.

Yes, applied already.

-- 
Venlig hilsen,
Peter Korsgaard 
