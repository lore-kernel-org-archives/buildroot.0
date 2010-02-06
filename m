From: Sebastian Schuberth <sschuberth@gmail.com>
Date: Sat, 6 Feb 2010 12:00:36 +0100
Subject: [Buildroot] Adding a package with source code in-tree
In-Reply-To: <e4b6ec781002051728n59b384b7k42117629f60d7e12@mail.gmail.com>
References: <bdca99241002050818h3c7e5f5ewbe4596cfc9e1ae43@mail.gmail.com>
	<e4b6ec781002051728n59b384b7k42117629f60d7e12@mail.gmail.com>
Message-ID: <bdca99241002060300o11573c5by2fdb5cbb357677a2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

thanks for the suggestion, but in fact I want my package to be built
when I type "make" in the buildroot root directory, just like any
other package. So I assume that's not possible, and I would have to
put my source code into some tar file and upload that to a server?

-- 
Sebastian Schuberth


On Sat, Feb 6, 2010 at 02:28, Stefan Schake <caytchen@gmail.com> wrote:

> Hey,
>
> you would probably want a completely manual makefile, since the
> package and autotools infrastructure assumes its located on some
> server.
> Theres an example for such a manual makefile in the documentation, and
> instead of downloading, you would just copy from source/ to the build
> directory.
>
> Greetings
>
> 2010/2/5 Sebastian Schuberth <sschuberth@gmail.com>:
>> Hi,
>>
>> I'd like to add a package to buildroot with the source code residing
>> inside the buildroot tree itself, i.e. in a directory like
>> "package/my_package/source". So far, I've only seen examples of *.mk
>> files that download the tarred source code from some server. Can
>> anyone tell me whether it's possible to just build already extracted
>> files that are in the tree, and how such an *.mk file would look like?
>>
>> Thanks.
>>
>> --
>> Sebastian Schuberth
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
