From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Thu, 20 Jun 2019 11:27:02 -0600
Subject: [Buildroot] [RFC PATCH] download/git: ban branch references
In-Reply-To: <20190619151817.6331-1-john@metanate.com>
References: <20190619151817.6331-1-john@metanate.com>
Message-ID: <CA+1k=2Zy3fgq+QQ9r7YYvz6+p7QFxSnmeCVEB+_yDmweziAA-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 19, 2019 at 9:19 AM John Keeping <john@metanate.com> wrote:
>
> As described in the manual, using a branch name as a version is not
> supported.  However, nothing enforces this so it is easy to specify a
> branch name either accidentally or because new developers have not read
> through the manual.

At a more general discussion level, I have to admit I like having the
ability to use a branch name even if it isn't supported. During
development I find it easier to use a branch name and just delete the
cached version to force it to re-download when I know I have new
updates.  I can switch to a tag when I have a version I actually want
tagged and "final."  Otherwise I'd have to keep tagging changes and
updating what tag to grab in the config or package file to pull in new
changes.

Granted, it isn't a huge inconvenience to switch how I do things, and
I could see it being useful to "idiot-proof" for people who don't
realize the potential problems with using branch names.  But I at
least wanted to make my opinion known that I like it the way it is.

-Joel
