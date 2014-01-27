From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 27 Jan 2014 09:10:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <CAAXf6LXbFyZg57qNevJG6_0MWRvtr0msenSOHT-7uv0rXdCcLA@mail.gmail.com>
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <CAAXf6LXbFyZg57qNevJG6_0MWRvtr0msenSOHT-7uv0rXdCcLA@mail.gmail.com>
Message-ID: <CAAXf6LVcjdkZdGjecXGXxFmV7iWogd_DWOJjB_sZLHRfCpLnug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Mon, Jan 20, 2014 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Bernd,
>
> On Mon, Jan 20, 2014 at 8:05 PM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
> [..]
>>
>> this is not true anymore:
>>
>> gst-ffmpeg: Use internal libav instead of external ffmpeg:
>> http://git.buildroot.net/buildroot/commit/?id=
>> 6ea49a23df3fa950e253bf704188e87a583a8ba4
>
>
> In fact, there is another patch in patchwork by Bogdan Radulescu that
> removes gst-ffmpeg entirely in favor of gst-libav:
> http://patchwork.ozlabs.org/patch/207431/
>
> The conclusion from patchwork cleanup session #4 was that this patch
> is still relevant. It seems that your patch (that has been included in
> buildroot already) addresses the same problem, but in a different way.
>
> It would be great if you and Bogdan could review the patch mentioned
> above in the light of the current buildroot version, and assess which
> parts of this patch still need to be applied, if any. For example, the
> patch removes gst-dsp and gst-omapfb from gstreamer, but that was for
> gstreamer1 and this is already addressed in current buildroot.

Bogdan indicated that he does not have time shortly to look into the
differences with his patch.
Could you have a look maybe?

Thanks,
Thomas
