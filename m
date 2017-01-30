From: Francesco Negri <francesconegri@gmail.com>
Date: Mon, 30 Jan 2017 10:38:29 +0100
Subject: [Buildroot] [PATCH 1/1] git-crypt: new package
In-Reply-To: <20170130052832.bo2h4xebwfbbe4zo@tarshish>
References: <20170130002853.76103-1-francesconegri@gmail.com>
 <20170130052832.bo2h4xebwfbbe4zo@tarshish>
Message-ID: <CA+KB-ZZX5EdzPJ32YP1PtXrwxUWZQe1B6UoO9si2uP3vvxJr3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch. Thanks for your help, this is my first patch for buildroot
and I am still learning how things work.

On 30 Jan 2017 6:28 am, "Baruch Siach" <baruch@tkos.co.il> wrote:
> You should also propagate BR2_PACKAGE_GIT dependency here (BR2_USE_MMU).

Right, will do.

> https://www.agwa.name/projects/git-crypt/ looks more informative.

Agreed.

> A dependencies comment is missing. See section 17.2.4 in the manual[1].

Sorry, missed that part. I will add it.

> Upstream tarball (see below) has upstream provided hash[2].
> Any reason not to use upstream tarball?

No reason, I simply didn't notice the tarball and the hash were
available, I will use those.

> A 'select BR2_PACKAGE_OPENSSL' in Config.in is missing.

Thanks, will add.

Francesco
