From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 19:18:56 +0100
Subject: [Buildroot] [PATCH 05/10] qextserialport: new package
In-Reply-To: <32f4831f7961e448c93c0eef1a9564436183cc73.1338653505.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:13:55 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <32f4831f7961e448c93c0eef1a9564436183cc73.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mwyywnvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> ---
 Thomas>  package/Config.in                                  |    1 +
 Thomas>  package/qextserialport/Config.in                   |    9 +++++
 Thomas>  .../qextserialport-main-include.patch              |   15 +++++++++
 Thomas>  .../qextserialport-no-examples.patch               |   17 ++++++++++
 Thomas>  .../qextserialport/qextserialport-pkgconfig.patch  |   19 +++++++++++
 Thomas>  package/qextserialport/qextserialport.mk           |   35

Committed with minor fixups to match current buildroot, thanks.

-- 
Bye, Peter Korsgaard
