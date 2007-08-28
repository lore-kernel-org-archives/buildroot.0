From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 28 Aug 2007 14:25:42 +0200
Subject: [Buildroot] jpeg-package with wrong include-dir
In-Reply-To: <f90898420708280109x64309671h96426a22b52b5eaf@mail.gmail.com>
References: <f90898420708280109x64309671h96426a22b52b5eaf@mail.gmail.com>
Message-ID: <20070828122542.GA24891@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2007 at 10:09:49AM +0200, Simon Pasch wrote:
>Shouldn't jpeg-package use staging_dir/usr/include instead of
>staging_dir/include?! (gtk2-package wants the header files to be there...)

Merged as r19712. Thanks!
