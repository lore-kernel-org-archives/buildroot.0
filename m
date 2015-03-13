From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 13 Mar 2015 12:15:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-12
In-Reply-To: <20150313073020.7B3C41015ED@stock.ovh.net>
References: <20150313073020.7B3C41015ED@stock.ovh.net>
Message-ID: <5502C6C9.80709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 13/03/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-03-12
> ===============================
>     mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ae92d6239fb9ce89aaab4dd950724ff1b6cfecd6/

it seems the host toolchain of your autobuilder box doesn't have support
for C++11:

------------------------
checking whether /usr/bin/g++ supports C++11 features by default... no
checking whether /usr/bin/g++ supports C++11 features with -std=c++11... no
checking whether /usr/bin/g++ supports C++11 features with -std=c++0x... no
configure: error: *** A compiler with support for C++11 language
features is required.
------------------------

Regards,
--
Vincent
