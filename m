From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:23:13 +0100
Subject: [Buildroot] [PATCH 00/23] Pull request for branch for-2012/doc
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMLJvvLUXss-Cvt77sUA8RrUHjSLQSAD5sLmMKjdXxvS9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/11 Samuel Martin <s.martin49@gmail.com>:
> Hi folks,
>
> Here is another round of the documentation refactoring, that, as we agreed
> during the last Buildroot developer Days, aims to be merged to move forward on
> this topic.
>
> This series has been rebased on the commit:
> 234fe4433489bca81b79311239569525cc008d9d
>
> and can be fetched from:
> https://github.com/tSed/buildroot.git for-2012.11/doc
>
> In addition to the new sections and random updates added since the last
> subimission of this patch series, the manual has grown quite a lot, especially
> since the last Buildroot developer Days.
>
> In details:
>
> * Added few tips when using Buildroot.
>
> * FAQ: Explanation why compiler/dev. files/documentation is not supported on the
>   target.
>
> * Start some explanation when 'make clean all' is necessary.
>
> * Added few tips for adding package.
>
> * Describe the sub-target of a package build.
>
> * Add few tips about how to use generated images.
>
> * Add a bunch of information about the Buildroot project community
>   (how to get help, how to contribute, ...)
>
> * Update the appendices:
>   - add the list of the deprecated stuff
>   - add the list of the packages integrated in Buildroot (which make a lot of
>     noise in the diff stat :P)
>
Ooops, forgot to mention that there still is some "TODO" here and
there in this series,
because I think I haven't all inputs to write them...
So, feel free to fill the gaps! :)

Regards,

-- 
Sam
