From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 09:05:57 +0200
Subject: [Buildroot] buildroot internal arm toolchain: gcc-final fails
 with supposedly large-file support
In-Reply-To: <52090BC7.5020500@mind.be>
References: <CAAXf6LWPA6C9EUpyqjZnjz2mtECRzoKLtwsGJrde7PHdUCUW8g@mail.gmail.com>
 <CAAXf6LVd+SMQt_H9QTCXvS485Nc+bp8AOiUTwA4OmKijR2byZg@mail.gmail.com>
 <CAHXCMM+4eOtm8mRH1Sf=QL72Sz6bss0fJQfvkFa3Qhch92bw-w@mail.gmail.com>
 <20130729133930.09abcb5b@skate>
 <CAAXf6LUib4JKaLQjzqicv3PbDhP6ZAT-ZZVFcxRNmugAgA13ZQ@mail.gmail.com>
 <52090BC7.5020500@mind.be>
Message-ID: <20130813090557.5b35c25a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 12 Aug 2013 18:22:31 +0200, Arnout Vandecappelle wrote:
> On 29/07/13 14:06, Thomas De Schampheleire wrote:
> > So maybe it is build-machine related? Or depending on if some host
> > package is installed or not?
> > Would it help if I send a build log?
> > If I have time, I can try to look into it myself, but not right now...
> 
>   I you could just start a clean build of this .config in a different O= 
> directory, we can see if it is build machine related or not... What kind 
> of build machine do you have?

I *think* that the problem only happens on a 32 bits build machine.

As Thomas noticed the problem has already been fixed by
7fc685c9e0c9479365ca44158c1e928e57e391a4 in the master branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
