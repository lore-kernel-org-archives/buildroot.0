From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 30 May 2018 22:46:18 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <20180530224134.0b87b6ad@windsurf.home>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
 <20180530174257.616403f2@windsurf.home>
 <a478a326-805a-0b80-2df6-4779211fdfd9@mind.be>
 <20180530224134.0b87b6ad@windsurf.home>
Message-ID: <181ae530-0fe5-70e8-71ad-62c8e0af73de@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 30/05/2018 ? 22:41, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 30 May 2018 22:35:50 +0200, Arnout Vandecappelle wrote:
> 
>>  How about:
>>
>> 1. Applying http://patchwork.ozlabs.org/patch/898748/, so the default is still
>> 2.28, but the user can choose another version.
>> 2. Reverting these two patches (no longer needed).
>> 3. Add a conditional warning to linux/Config.in that an unpatched kernel will
>> fail to boot.
>> 4. Eventually, add the patch that fixes the kernel to the stm32* defconfigs.
> 
> Sounds like a good plan to me.
> 
> Christophe, do you think you can provide the patches implementing this ?

I've sent a mail to Nick Clifton about this issue on the Binutils mailing list.

https://sourceware.org/ml/binutils/2018-05/msg00348.html

Best regards,
Romain
> 
> Best regards,
> 
> Thomas
> 
