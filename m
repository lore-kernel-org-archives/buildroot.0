From: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Date: Fri, 19 Oct 2012 11:46:10 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <20121019093805.GA2382@mail.sceen.net>
References: <508118F0.3030202@6wind.com> <20121019093805.GA2382@mail.sceen.net>
Message-ID: <50812162.7090809@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/2012 11:38, Richard Braun wrote:
> On Fri, Oct 19, 2012 at 11:10:08AM +0200, Jean-Mickael Guerin wrote:
>> There is a partial copy of toolchain's sysroot in staging directory,
>> and the ext-wrapper will force this directory with --sysroot.
>>
>> Which problem this procedure is supposed to fix?
>
> It tells the compiler where to find headers and libraries. The original
> toolchain directory is fine for the standard libraries, but not for
> those installed afterwards.
>
I would expect the wrapper the use -I and -L to help the lookup of 
headers and libraries installed afterwards. Why --sysroot?
