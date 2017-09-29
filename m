From: Robert Lerche <robert.lerche@msbit.com>
Date: Fri, 29 Sep 2017 09:53:25 -0700
Subject: [Buildroot] Private mirror repository for Python package
	dependencies -- howto?
Message-ID: <CAF7SrrG6-FgUdN3HESU_vGX4+HEfrU8hfFQc9VzH9wh2GugxBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot provides a simple and effective means to specify a private mirror
for package source code components (BR2_PRIMARY_SITE).  This is essential
for a company basing an embedded system product on Buildroot.

Is there an equivalent mechanism to support a private repository for Python
package dependencies?  Otherwise distutils and setuptools will fetch from
public sources even though the package base comes from the private mirror.

Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170929/9035b667/attachment.html>
