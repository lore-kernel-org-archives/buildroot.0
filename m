From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2020 15:12:37 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200707122125.102c9bea@windsurf> (Thomas Petazzoni's message of
 "Tue, 7 Jul 2020 12:21:25 +0200")
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home> <20200705173702.GI2273@scaer>
 <20200707122125.102c9bea@windsurf>
Message-ID: <87mu4b4gfu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > I've added Peter in Cc, as he is taking care of the sources.b.o
 > maintenance. I think it is done on the OSUOSL machine, because Peter
 > has a script update-br-mirror.sh on this machine.

Indeed. That machine runs CentOS 7:

cat /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"

-- 
Bye, Peter Korsgaard
