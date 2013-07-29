From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 29 Jul 2013 14:06:31 +0200
Subject: [Buildroot] buildroot internal arm toolchain: gcc-final fails
 with supposedly large-file support
In-Reply-To: <20130729133930.09abcb5b@skate>
References: <CAAXf6LWPA6C9EUpyqjZnjz2mtECRzoKLtwsGJrde7PHdUCUW8g@mail.gmail.com>
 <CAAXf6LVd+SMQt_H9QTCXvS485Nc+bp8AOiUTwA4OmKijR2byZg@mail.gmail.com>
 <CAHXCMM+4eOtm8mRH1Sf=QL72Sz6bss0fJQfvkFa3Qhch92bw-w@mail.gmail.com>
 <20130729133930.09abcb5b@skate>
Message-ID: <CAAXf6LUib4JKaLQjzqicv3PbDhP6ZAT-ZZVFcxRNmugAgA13ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 29, 2013 at 1:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Mon, 29 Jul 2013 13:35:41 +0200, Samuel Martin wrote:
>
>> >> The .config file is in attachment.
>> >> Largefile support is not enabled, yet for some reason gcc thinks it
>> >> is. I haven't been able to look into detail why this is so.
>> >
>> > For the record: just had the same type of problem with powerpc as well...
>>
>> Yesterday, I gave a run using your config and it worked fine here.
>
> I just built the following defconfig, and it build fine here:
>
> BR2_arm=y
>
> That said, I remember we had reports of similar problems some time ago,
> but I don't remember enough informations to find related e-mails on the
> list.

So maybe it is build-machine related? Or depending on if some host
package is installed or not?
Would it help if I send a build log?
If I have time, I can try to look into it myself, but not right now...

Best regards,
Thomas
