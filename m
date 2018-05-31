From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 31 May 2018 08:34:08 +0000
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <20180530224134.0b87b6ad@windsurf.home>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
 <20180530174257.616403f2@windsurf.home>
 <a478a326-805a-0b80-2df6-4779211fdfd9@mind.be>
 <20180530224134.0b87b6ad@windsurf.home>
Message-ID: <cd9bc020-7228-60f5-187e-70c9c4274c37@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
  I'm ok to provide the patches.

  For the warning, can you point to me an example or a documentation
to write a "conditional warning" on Kconfig.

Regards
Christophe


On 05/30/2018 10:41 PM, Thomas Petazzoni wrote:

Hello,

On Wed, 30 May 2018 22:35:50 +0200, Arnout Vandecappelle wrote:



 How about:

1. Applying http://patchwork.ozlabs.org/patch/898748/, so the default is still
2.28, but the user can choose another version.
2. Reverting these two patches (no longer needed).
3. Add a conditional warning to linux/Config.in that an unpatched kernel will
fail to boot.
4. Eventually, add the patch that fixes the kernel to the stm32* defconfigs.



Sounds like a good plan to me.

Christophe, do you think you can provide the patches implementing this ?

Best regards,

Thomas



--


Best regards / Cordialement,

[cid:part1.157DF46A.633AF376 at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180531/fbf4e813/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180531/fbf4e813/attachment.png>
