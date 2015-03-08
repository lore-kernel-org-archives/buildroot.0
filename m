From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 8 Mar 2015 12:29:23 +0100
Subject: [Buildroot] [PATCH 1/4 v5] package/cmake: make ctest a target
 package too
In-Reply-To: <20150308095318.GY2376@sapphire.tkos.co.il>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-2-git-send-email-s.martin49@gmail.com>
 <20150308095318.GY2376@sapphire.tkos.co.il>
Message-ID: <CAHXCMMJL4TQ2mW8joJuU4sHn0xO3eMDpbbuyf3A-bPQN7vEttQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2015 at 10:53 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel, Davide,
>
> On Sun, Mar 08, 2015 at 10:47:20AM +0100, Samuel Martin wrote:
>> From: Davide Viti <zinosat@tiscali.it>
>>
>> Useful for packages shipped with a testsuite which makes use of ctest
>>
>> Since ctest is just a tool provided by the cmake sources, this change
>> introduces a hidden BR2_PACKAGE_CMAKE symbol which is automatically
>> selected by the BR2_PACKAGE_CMAKE_CTEST one.
>> This is like this mostly for consistency (cmake is the actual package,
>> not ctest).
>>
>> CMake is a particular package:
>
> peculiar ?

argh! some remaining frenchism :-s
good catch btw ;-)


-- 
Samuel
