From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 26 Jan 2017 09:15:52 +0100
Subject: [Buildroot] [V4 1/1] python-mutagen: new package
In-Reply-To: <20170126210844.719a364b@free-electrons.com>
References: <20170125162610.24101-1-aduskett@codeblue.com>
 <20170126210844.719a364b@free-electrons.com>
Message-ID: <CAGm1_kvv333QSzgkE2iaeJ89Z48xJAVcSK+qSD2VaTr89bANeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jan 26, 2017 at 9:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 25 Jan 2017 11:26:10 -0500, Adam Duskett wrote:
>> +     help
>> +       Mutagen is a Python module to handle audio metadata.
>> +       It supports ASF, FLAC, MP4, Monkey?s Audio, MP3, Musepack, Ogg Opus,
>> +       Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True Audio, WavPack,
>> +       OptimFROG, and AIFF audio files. All versions of ID3v2 are supported,
>> +       and all standard ID3v2.4 frames are parsed.
>> +
>> +       It can read Xing headers to accurately calculate the bitrate and length
>> +       of MP3s. ID3 and APEv2 tags can be edited regardless of audio format.
>> +       It can also manipulate Ogg streams on an individual packet/page level.
>
> These lines were too long, and contained some trailing white space. I
> fixed that up.
>
>> +PYTHON_MUTAGEN_VERSION = 1.36
>> +PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
>> +PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/69/14/4a5c8360a727563291a7159de935ffff2b99ee783928169f0fea7445370f
>> +PYTHON_MUTAGEN_LICENSE = LGPLv2+
>
> Yegor told you the license was GPLv2+, so why do you write LGPLv2+ here?
>
> But in fact, Yegor was wrong I believe, the license is actually
> just GPLv2, I haven't seen any "or later" statement anywhere.

This is the stuff I still don't really grok. How do I tell whether it
is GPLv2 or GPLv2+?

This passage [1] contains such a sentence:

"either version 2 of the License, or (at your option) any later version."

Is this not enough? This is what our manual states in regard to GPLv2+:

"GPLv2+: GNU General Public License, version 2 or (at your option) any
later version;"

This is what I used to as a rule.

[1] https://github.com/quodlibet/mutagen/blob/master/COPYING#L296

Yegor
