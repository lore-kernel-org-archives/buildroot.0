From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 21:39:07 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <20171106175012.GA2763@scaer> (Yann E. MORIN's message of "Mon, 6
 Nov 2017 18:50:12 +0100")
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
 <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
 <20171106175012.GA2763@scaer>
Message-ID: <87d14vw39w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > I do see your use case, and I do understand it: you basically want to do
 > partial upgrades of your system (for various reasons that are your own
 > right).

 > But Buildroot does not build packages like a distro, like OpenEmbedded
 > or like openWRT (or others) do.

 > Instead, Buildroot builds a complete rootfs; it is the atomic artefact
 > output by Buildroot. As such, what matters for Buildroot is the whole,
 > not the parts.

 > See also the manual, where we explain at length why we are not doing
 > binary packages, especially the last part about our position statement,
 > tangentially related to the explanation of your use-case:
 >     https://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages

Small deltas might be interesting even though you do full system
upgrades, E.G. to save on bandwidth with binary delta tools like xdelta/bsdiff
or casync. I believe there was some talk about adding casync support to
rauc.

 > Sorry if you found my and the others' replies to imply that you should
 > "shut up". That was definitely not my intention, and I know Peter,
 > Arnout and Thomas enough to know that it was not theirs as well.

Exactly!

-- 
Bye, Peter Korsgaard
