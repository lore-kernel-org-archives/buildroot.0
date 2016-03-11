From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 15:19:59 +0100
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <56E2B03B.9000701@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 11 Mar 2016 08:47:07 -0300")
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk> <56E2A91A.1030509@zacarias.com.ar>
 <87wpp9i6se.fsf@dell.be.48ers.dk> <56E2B03B.9000701@zacarias.com.ar>
Message-ID: <87oaalhzao.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > Now, since newer libgtk3 versions mandate some form of GL support,
 > which is wrapped by libepoxy and provided by mesa, doesn't it make
 > sense that said GL support is accelerated?

Yes it does, it is just not clear to me that using this gallium driver
is the way to do it. Your commit message also didn't explain this, which
is why I'm asking.

Is this gallium driver useful for non-wayland (X11) setups? If not,
perhaps it should depend on wayland.

-- 
Venlig hilsen,
Peter Korsgaard 
