From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
Date: Tue, 28 Jan 2014 11:50:30 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
Message-ID: <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

>>
> I am not sure I fully get your patch, what is wrong with putting
> path/to/my_script.sh ? You don't have to specify the full path, a
> relative path works well.

Nothing is wrong to put full path to your scripts. Just a matter of
what you prefer.

Try to put script file in buildroot directory and set the post script
variable  using just the name of the script. I does not work for me
and I'm pretty sure it does not work for you as well. This is simply
how Makefile calls the scripts.

This patch is just addition to run post scripts referenced by relative
paths as well, nothing more.

Thanks,
/Waldek
