From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 09:29:25 -0300
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <20131015102642.5f579a88@skate>
References: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>	<87fvs3pqml.fsf@dell.be.48ers.dk>	<525C4F56.8010101@zacarias.com.ar>	<87iowzoanz.fsf@dell.be.48ers.dk>
 <20131015102642.5f579a88@skate>
Message-ID: <525D3525.4020805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2013 05:26 AM, Thomas Petazzoni wrote:

> At least mention that in package help text (that, IIUC, it normally
> depends on OpenSSH, but there are patches or other ways to make it work
> with Dropbear, possibly giving pointers to those patches).

On a quick qemu run it works without tweaks - i didn't try the odd
options though, just the basics.
Looking at details the openwrt patch for autossh+dropbear is gone so
evidently it's upstream (by looking at it).
No need to add anything up except maybe "remember to select a ssh
package" (or depend on OPENSSH | DROPBEAR).
Regards.
