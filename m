From: Bryce Schober <bryce.schober@gmail.com>
Date: Thu, 13 Nov 2014 13:53:35 -0800
Subject: [Buildroot] out-of-tree kernel modules and linux header versions
In-Reply-To: <54650AFD.8030005@mind.be>
References: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
 <54650AFD.8030005@mind.be>
Message-ID: <CAJpxd06ufPrbqDtTzhA-wTmv99DmFUg_HbEruvy9ORxFhqu_3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After all that, reviewing my problem with a colleague showed that my eyes
were off by one, and the compiler was complaining about a different type
altogether, which actually isn't available in 2.6.29. I was hoping that
this driver would support the cfg80211 interface before 2.6.35, but that
appears not to be the case, at least as it is currently implemented.

Sorry for the wild-goose chase.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141113/2e67156d/attachment.html>
