From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 28 Jan 2014 12:08:04 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
 <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
Message-ID: <CAGduivzLfzfpvSWqH46YAhjbLgkHTKa1Qfu07eyO4Rh1foMJqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 28, 2014 at 11:50 AM, Waldemar Rymarkiewicz
<waldemar.rymarkiewicz@gmail.com> wrote:
> Hi
>
>>>
>> I am not sure I fully get your patch, what is wrong with putting
>> path/to/my_script.sh ? You don't have to specify the full path, a
>> relative path works well.
>
> Nothing is wrong to put full path to your scripts. Just a matter of
> what you prefer.
>
> Try to put script file in buildroot directory and set the post script
> variable  using just the name of the script. I does not work for me
> and I'm pretty sure it does not work for you as well. This is simply
> how Makefile calls the scripts.
Okay, I did not understood where the problem came from as I never put
my scripts at the root but in a special directory inside buildroot
boards folder so it never happened to me.
Thanks for the clarifications.
>
> This patch is just addition to run post scripts referenced by relative
> paths as well, nothing more.
>
> Thanks,
> /Waldek
