From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 12 Aug 2013 21:24:37 +0200
Subject: [Buildroot] buildroot internal arm toolchain: gcc-final fails
 with supposedly large-file support
In-Reply-To: <52090BC7.5020500@mind.be>
References: <CAAXf6LWPA6C9EUpyqjZnjz2mtECRzoKLtwsGJrde7PHdUCUW8g@mail.gmail.com>
 <CAAXf6LVd+SMQt_H9QTCXvS485Nc+bp8AOiUTwA4OmKijR2byZg@mail.gmail.com>
 <CAHXCMM+4eOtm8mRH1Sf=QL72Sz6bss0fJQfvkFa3Qhch92bw-w@mail.gmail.com>
 <20130729133930.09abcb5b@skate>
 <CAAXf6LUib4JKaLQjzqicv3PbDhP6ZAT-ZZVFcxRNmugAgA13ZQ@mail.gmail.com>
 <52090BC7.5020500@mind.be>
Message-ID: <CAAXf6LWiPuamB03YWL5BT9jiDEiOu+O38T5vHm0qU38Eyo6qNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Op 12-aug.-2013 20:45 schreef "Arnout Vandecappelle" <arnout@mind.be> het
volgende:
>
> On 29/07/13 14:06, Thomas De Schampheleire wrote:
>>
>> So maybe it is build-machine related? Or depending on if some host
>> package is installed or not?
>> Would it help if I send a build log?
>> If I have time, I can try to look into it myself, but not right now...
>
>
>  I you could just start a clean build of this .config in a different O=
directory, we can see if it is build machine related or not... What kind of
build machine do you have?

Meanwhile, Francois Perrad also noticed this issue and submitted a patch
for it, which has been applied. Problem fixed...
(Don't have the commit id at hand, sorry)

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130812/86e49f13/attachment.html>
