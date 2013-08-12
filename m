From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 18:22:31 +0200
Subject: [Buildroot] buildroot internal arm toolchain: gcc-final fails
 with supposedly large-file support
In-Reply-To: <CAAXf6LUib4JKaLQjzqicv3PbDhP6ZAT-ZZVFcxRNmugAgA13ZQ@mail.gmail.com>
References: <CAAXf6LWPA6C9EUpyqjZnjz2mtECRzoKLtwsGJrde7PHdUCUW8g@mail.gmail.com>
 <CAAXf6LVd+SMQt_H9QTCXvS485Nc+bp8AOiUTwA4OmKijR2byZg@mail.gmail.com>
 <CAHXCMM+4eOtm8mRH1Sf=QL72Sz6bss0fJQfvkFa3Qhch92bw-w@mail.gmail.com>
 <20130729133930.09abcb5b@skate>
 <CAAXf6LUib4JKaLQjzqicv3PbDhP6ZAT-ZZVFcxRNmugAgA13ZQ@mail.gmail.com>
Message-ID: <52090BC7.5020500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/07/13 14:06, Thomas De Schampheleire wrote:
> So maybe it is build-machine related? Or depending on if some host
> package is installed or not?
> Would it help if I send a build log?
> If I have time, I can try to look into it myself, but not right now...

  I you could just start a clean build of this .config in a different O= 
directory, we can see if it is build machine related or not... What kind 
of build machine do you have?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
