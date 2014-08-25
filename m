From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Mon, 25 Aug 2014 23:13:37 +0200
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20140825181614.3f5c22a0@free-electrons.com>
References: <20140825063011.07B50101AB1@stock.ovh.net>
 <20140825181614.3f5c22a0@free-electrons.com>
Message-ID: <53FBA701.8010104@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 08/25/2014 06:16 PM, Thomas Petazzoni wrote:
>
>>        bfin |                 upmpdcli-0.7.1 | NOK | http://autobuild.buildroot.net/results/8e0db6a753c7d2af2cdb11f025879c9cdb57a25d/
> libupnpp/log.cxx:31: error: no matching function for call to 'std::basic_ofstream<char, std::char_traits<char> >::open(const std::basic_string<char, std::char_traits<char>, std::allocator<char> >&, std::_Ios_Openmode)'
>
> I love C++.
>
> Joerg, since you are the original submitter of the upmpdcli package,
> can you look into this issue?

I love C++, too :-) Especially C++11, which is not supported by GNU 
Toolchains for Blackfin.

Patch is send to the mailing list.
