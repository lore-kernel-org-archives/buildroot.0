From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 12 Mar 2012 10:19:54 -0400
Subject: [Buildroot] [PATCH 1/2] uboot: Add support for copying MLO to
 the images directory for U-boot builds that include it.
In-Reply-To: <201203111633.27504.arnout@mind.be>
References: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
 <201203111633.27504.arnout@mind.be>
Message-ID: <CA+-urNQHfKJx7kPqnE0DQKoUdxVRmbfMaOwNbw5FCR_sqh9_qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 11, 2012 at 11:33 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Thursday 08 March 2012 14:47:02 Frank Hunleth wrote:
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> ?Nicolas Dechesne posted patches for adding MLO a while ago. ?I don't
> remember if they were ready to be merged or not. ?But this one looks
> pretty good. ?So:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>

I just looked at Nicolas's patches in the archives. If they get
merged, it looks trivial to rebase the beaglebone patch to reference
his. I'll watch to see what happens.

Thanks,
Frank
