From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 Jan 2015 15:29:06 +0100
Subject: [Buildroot] [PATCH v3] svgtiny: update source url
In-Reply-To: <20150105141547.0daa89c8@free-electrons.com>
References: <1420455729-15649-1-git-send-email-fabio.porcedda@gmail.com>
 <20150105141547.0daa89c8@free-electrons.com>
Message-ID: <CAHkwnC_aRYSYQE-b_rdOCoe5u9U+Stq1VZ6nZEdmjkv+nArQeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 5, 2015 at 2:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon,  5 Jan 2015 12:02:09 +0100, Fabio Porcedda wrote:
>
>> Also because the git repository does not include the netsurf core
>> buildsystem source that are needed to build this package add those
>> sources as a patch.
>
> Is this core buildsystem source code available in a separate
> repository, that we could package as a dependency of svgtiny?

Yes, the repository is:
http://git.netsurf-browser.org/buildsystem.git/

But those sources alone do nothing, the build and install target of
this package will be empty.
Also to use those files at least a symbolic link must be added to the
libsvgtiniy directory to access buildsystem.git files.
Considering all of this it is still preferably worth adding a separate
package for those files?

BR
-- 
Fabio Porcedda
