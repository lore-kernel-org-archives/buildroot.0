From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 13:48:05 +0200
Subject: [Buildroot] [PATCH 2/2] gettext: install ABOUT-NLS for the host
In-Reply-To: <CACt6We1majKpaUA3SB0CuVYKXsVFB_miM0PfbBwD2TqceOYN6w@mail.gmail.com>
 (Joris Lijssens's message of "Tue, 21 Jun 2016 13:27:19 +0200")
References: <1466495278-30897-1-git-send-email-peter@korsgaard.com>
 <1466495278-30897-3-git-send-email-peter@korsgaard.com>
 <CACt6We1majKpaUA3SB0CuVYKXsVFB_miM0PfbBwD2TqceOYN6w@mail.gmail.com>
Message-ID: <8737o6zrt6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joris" == Joris Lijssens <joris.lijssens@gmail.com> writes:

 > Hello Peter,
 > Will this patch fix the libuio <foo>_AUTORECONF=YES issue?

Yes (almost). There's still a minor problem in configure.ac, but I'll
reply to the patch with details later today.

-- 
Venlig hilsen,
Peter Korsgaard 
