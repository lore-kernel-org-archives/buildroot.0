From: =?utf-8?B?SnVsaWVuIELDqXJhdWQ=?= <julien.beraud@orolia.com>
Date: Fri, 20 Sep 2019 08:02:16 +0000
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <20190920095352.5279ffcf@windsurf>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
 <87ef0c1f4j.fsf@dell.be.48ers.dk>
 <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
 <20190919214812.6f719f06@windsurf>
 <8d2d7eed-81d2-e2bf-4345-cac3f73ad01c@orolia.com>
 <20190920095352.5279ffcf@windsurf>
Message-ID: <219cb797-3e57-7cd7-f870-ff92d4b1e9a7@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/2019 09:53, Thomas Petazzoni wrote:

>> Thanks for the explanation. So the correct way to send a patch for a
>> specific branch is :
>> [PATCH branch-name] ... ?
> 
> Yes, with the exception that you can/should omit branch-name when the
> target branch is master. So essentially, it's only for special cases (a
> patch for the next branch, when the next branch is open, or for a
> LTS/maintenance branch) that you need to specify the branch name. When
> there's no branch name, we assume your patch targets master.

Thanks very much.
