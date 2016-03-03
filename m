From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 3 Mar 2016 09:13:46 -0800
Subject: [Buildroot] GSOC idea
In-Reply-To: <8737s78phs.fsf@dell.be.48ers.dk>
References: <CAJJ6jxuwU=A6ph4MCnz_hF4kODpf5yFsTeZwzTEgWz06wMjZjQ@mail.gmail.com>
 <87d1rdjpfn.fsf@dell.be.48ers.dk>
 <CAJJ6jxvHKwtXx9YdMw3Txc7vQeX9VEk4dp5Om5ZvJmQVjBAf2w@mail.gmail.com>
 <8737s78phs.fsf@dell.be.48ers.dk>
Message-ID: <CAJJ6jxtcUMBxo+MxC6tATUFrhSNojgPCOUzExWGps2=OPd6i7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 3, 2016 at 9:01 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:
>
> Hi,
>
>  > And my buildroot .config contains:
>  > BR2_GENERATE_LOCALE="en_US"
>
> The "normal" unicode variant of this is en_US.UTF-8:

Ouch, maybe something stupid like this broke my test.

>
> locale
> LANG=en_US.UTF-8
> LANGUAGE=en_US:en
> LC_CTYPE="en_US.UTF-8"
> LC_NUMERIC="en_US.UTF-8"
> LC_TIME="en_US.UTF-8"
> LC_COLLATE="en_US.UTF-8"
> LC_MONETARY="en_US.UTF-8"
> LC_MESSAGES="en_US.UTF-8"
> LC_PAPER="en_US.UTF-8"
> LC_NAME="en_US.UTF-8"
> LC_ADDRESS="en_US.UTF-8"
> LC_TELEPHONE="en_US.UTF-8"
> LC_MEASUREMENT="en_US.UTF-8"
> LC_IDENTIFICATION="en_US.UTF-8"
> LC_ALL=
>
>  > If someone can tell me how I can just cat a file with a utf8 widechar
>  > in busybox, I think I can continue from there.
>
> Do you mean with a utf8 filename or containing utf8 text?
>

I mainly wish to just have utf8 filenames. The files I am interested
in right now are binaries. I have not upgraded to the latest 2016.02
release. I will also do that and try again.

Regards, Steve
