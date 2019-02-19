From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 08:25:50 +0100
Subject: [Buildroot] [PATCH 1/1] libb64: Fix integer overflow and
 uninitialized C++ objects.
In-Reply-To: <20190206163122.64783086@windsurf> (Thomas Petazzoni's message of
 "Wed, 6 Feb 2019 16:31:22 +0100")
References: <20180823140446.6434-1-mikael@robomagi.com>
 <20190206163122.64783086@windsurf>
Message-ID: <87bm38b5oh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 23 Aug 2018 16:04:46 +0200
 > Mikael Eliasson <mikael@robomagi.com> wrote:

 >> Fixes a runtime bug on compilers where unsigned char is the default.
 >> Fixes a runtime bug where _state variable in the encoder and decoder 
 >> c++ objects where not initialized by the constructors.
 >> 
 >> Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
 >> ---
 >> package/libb64/0001-Integer-overflows.patch   | 68 +++++++++++++++++++
 >> .../libb64/0002-Initialize-C++-objects.patch  | 35 ++++++++++
 >> 2 files changed, 103 insertions(+)
 >> create mode 100644 package/libb64/0001-Integer-overflows.patch
 >> create mode 100644 package/libb64/0002-Initialize-C++-objects.patch

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
