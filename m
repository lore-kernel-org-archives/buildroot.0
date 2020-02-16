From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Feb 2020 14:41:19 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to
 version 3.17.0
In-Reply-To: <874kvqhank.fsf@dell.be.48ers.dk>
References: <20200213055608.76191-1-james.hilliard1@gmail.com>
 <874kvqhank.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4odT-+_2q6e+53ZyihvDnajhCtkN3e1BHXNvYHNhWweng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 16, 2020 at 7:25 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Committed, thanks.
>
> What is the use case for this library in Buildroot? Isn't it just
> identical to the json module included with python / python3?
I think it's an optional serialization option for other libraries,
although I'm not really using it myself(I bumped it while updating
a bunch of outdated python packages that looked like one of
my projects might end up using at some point in the near future).
>
> --
> Bye, Peter Korsgaard
