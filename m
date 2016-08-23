From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 23:40:27 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <87d1kzjj2w.fsf@dell.be.48ers.dk>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d1kzjj2w.fsf@dell.be.48ers.dk>
Message-ID: <20160823234027.49044576@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 23:01:27 +0200, Peter Korsgaard wrote:

> I know this is just a first try (and I don't mind), but interesting that
> your script flagged me for wpa_supplicant (and nobody else), considering
> I have never used it in buildroot, a number of other people have added
> new features and fixes, and my last real fix to it was in 2010.

It's because of commit 6828f982b89c4f85101fb8cfd5987ae4b1992de8:

commit 6828f982b89c4f85101fb8cfd5987ae4b1992de8
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Mar 9 20:28:40 2009 +0000

    wpa_supplicant: new package
    
    Patch by Gustavo Zacarias <gustavo@zacarias.com.br>
    
    Closes #81.

The patch was indeed provided by Gustavo, but you are the author of the
patch, and that's what my script was looking at.

I'll change that and put Gustavo as the referee for the wpa_supplicant
package.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
