From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 23 Mar 2012 13:27:50 -0300
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
	tool
In-Reply-To: <20120323165415.6f62c95d@skate>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <20120323155103.54f93fa3@skate>
 <20120323150517.GS444@game.jcrosoft.org>
 <20120323163218.5915f640@skate>
 <20120323153727.GT444@game.jcrosoft.org>
 <20120323165415.6f62c95d@skate>
Message-ID: <CAAAP30GNdXcQP8hMKBNVxDmeHVWqXYfXke41cmNgzCpqzOi6fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 12:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 23 Mar 2012 16:37:27 +0100,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :
>
>> but the source is up-to-date for the kernel you use
>>
>> we get this discussion on the kernel we do only expect the dtc that is
>> provided byt the kernel that you compile to be used. If you use other verison
>> we do not garanty it will work.
>
> Ok, that's good to know, thanks!

Why not move this into the linux.mk package?
If the user has selected DTC support, just copy from the built kernel.
