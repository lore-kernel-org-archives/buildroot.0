From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 10 Jun 2020 00:41:14 +0200
Subject: [Buildroot] (no subject)
Message-ID: <20200609224116.13607-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

haveged could create the service file itself, by adding
eg. '--enable-init=service.fedora' to configure.

However the templates available are either overloaded with isolation
options (fedora) or dated (everything else).
So I ended up taking the fedora file and cutting out those options.

added a version bump while at it.
