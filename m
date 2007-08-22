From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 15:16:14 +0200
Subject: [Buildroot] libdrm with wrong include-dir
In-Reply-To: <f90898420708220536h695f49bcy3c227fd36784b5d5@mail.gmail.com>
References: <f90898420708220536h695f49bcy3c227fd36784b5d5@mail.gmail.com>
Message-ID: <20070822131614.GA10015@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 02:36:00PM +0200, Simon Pasch wrote:
>Shouldn't libdrm-package use staging_dir/usr/include instead of
>staging_dir/include?!

indeed, see r19646. Thanks!
