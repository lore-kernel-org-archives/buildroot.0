From: Mark Hawthorne <markhawthorne172@gmail.com>
Date: Mon, 16 Sep 2019 17:52:04 -0500
Subject: [Buildroot] Adding build-time dependency on virtual package
Message-ID: <CAEEV9O3j8eDQpOAcjMoAn9VLTopOETjHb6V=2jaYMD7K_c4H6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am building a package which requires an implementation of libegl. The EGL
library is specified as a virtual package. How do I add EGL as a build time
dependency without specify the package which implements the virtual package?

For example, right now my package dependency variable looks like this:
MY_PKG_DEPENDENCIES = ti-sgx-um

...where ti-sgx-um provides the EGL library. However, this locks this
package into a specific GPU library.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190916/427ddb5a/attachment.html>
