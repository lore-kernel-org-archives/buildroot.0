From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Apr 2012 10:46:24 +0200
Subject: [Buildroot] [PATCH 1/2] heirloom-mailx: new package
In-Reply-To: <892cb61cad940f6b378ebc04e9cc3a216d1d11f0.1334677614.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 17:46:56 +0200")
References: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
 <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
 <892cb61cad940f6b378ebc04e9cc3a216d1d11f0.1334677614.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871un54nfj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                        |    1 +
 Thomas>  package/heirloom-mailx/Config.in         |   13 +++++++++++++
 Thomas>  package/heirloom-mailx/heirloom-mailx.mk |   28 ++++++++++++++++++++++++++++
 Thomas>  3 files changed, 42 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/heirloom-mailx/Config.in
 Thomas>  create mode 100644 package/heirloom-mailx/heirloom-mailx.mk

There seems to be some libiconv related build problems. Care to take a
look?

http://autobuild.buildroot.org/results/08c1f9d776ca26823d0f256cb85a769794060936/build-end.log

-- 
Bye, Peter Korsgaard
