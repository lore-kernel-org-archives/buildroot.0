From: Christian Stewart <christian@paral.in>
Date: Tue, 10 Mar 2020 18:14:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.14
In-Reply-To: <20200310111946.197543-1-christian@paral.in>
References: <20200310111946.197543-1-christian@paral.in>
Message-ID: <CA+h8R2qoYov7f1AR762C87J5rihzz=ORQdzeouFCkzCS3psQUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Mar 10, 2020 at 4:19 AM Christian Stewart <christian@paral.in> wrote:
>
> Release notes: https://golang.org/doc/go1.14

In this release the Go maintainers have changed the host-go "go"
binary to a symlink to lib/go for some reason.

That breaks the Buildroot package upon upgrading to 1.14, although the
package compiles successfully, the "go" file is empty.

Retracting this patch for now until I have found a solution.

Best regards,
Christian
