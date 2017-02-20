From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Feb 2017 19:14:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-02-16
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr> <20170220134111.1bc02a9f@free-electrons.com>
Message-ID: <XnsA722C3D2282F8ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20170220134111.1bc02a9f at free-electrons.com: 

>> >       x86_64 |                   libcec-4.0.2 | NOK |
>> >       http://autobuild.buildroot.net/results/e7505f36d7c2cfaf7527515b2
>> >       e3014c2e8e2c5ca  
>> 
>>     undefined reference to `std::__cxx11::basic_string<char,
>>     std::char_traits<char>, std::allocator<char> >::basic_string
>>     (std::__cxx11::basic_string<char, std::char_traits<char>,
>>     std::allocator<char> >&&)@GLIBCXX_3.4.21'
>> 
>> Some ugly C++11 issue? Bernd?
> This one has been there for a long time, since we bumped libcec to
> 4.0.2. I will revert the version bump in the next days if no fix is
> proposed.

Afaics there are two different build failures with libcec-4.0.2.

I could not reproduce the one you mentioned here using this defconfig:
http://autobuild.buildroot.net/results/38b/38ba94fe0db1544e78fd69dcbd77a452e1
21deba/

I could however reproduce the other build failure, like this one:
http://autobuild.buildroot.net/results/faa/faa5270be0a54043891db9baf50a217eae
2c575f/

I posted my findings here: http://lists.busybox.net/pipermail/buildroot/2017-
February/184248.html

Regards, Bernd
