From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Mar 2016 18:01:35 +0100
Subject: [Buildroot] GSOC idea
In-Reply-To: <CAJJ6jxvHKwtXx9YdMw3Txc7vQeX9VEk4dp5Om5ZvJmQVjBAf2w@mail.gmail.com>
 (Steve Calfee's message of "Thu, 3 Mar 2016 08:58:01 -0800")
References: <CAJJ6jxuwU=A6ph4MCnz_hF4kODpf5yFsTeZwzTEgWz06wMjZjQ@mail.gmail.com>
 <87d1rdjpfn.fsf@dell.be.48ers.dk>
 <CAJJ6jxvHKwtXx9YdMw3Txc7vQeX9VEk4dp5Om5ZvJmQVjBAf2w@mail.gmail.com>
Message-ID: <8737s78phs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

Hi,

 > And my buildroot .config contains:
 > BR2_GENERATE_LOCALE="en_US"

The "normal" unicode variant of this is en_US.UTF-8:

locale
LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=

 > If someone can tell me how I can just cat a file with a utf8 widechar
 > in busybox, I think I can continue from there.

Do you mean with a utf8 filename or containing utf8 text?

-- 
Venlig hilsen,
Peter Korsgaard 
