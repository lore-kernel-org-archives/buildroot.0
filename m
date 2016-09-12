From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Sep 2016 22:02:52 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <CALe+oY-r_4eY1CLEXezkU0vrCAj8wFAA=NTycpoBS7C9ELLxpw@mail.gmail.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <20160911155431.6204c127@free-electrons.com>
 <44f2d9ff-605a-f414-21df-e9d3eace0164@mind.be>
 <20160911231539.29e123e3@free-electrons.com>
 <CALe+oY-r_4eY1CLEXezkU0vrCAj8wFAA=NTycpoBS7C9ELLxpw@mail.gmail.com>
Message-ID: <a5aca982-4a81-7f33-4c46-a331cf8a6675@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-16 18:06, James Knight wrote:
> On Sun, Sep 11, 2016 at 9:54 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Could you give some details on why the rpm.org version is better than
>> the rpm5.org version?
> 
> I'll resubmit with a more proper commit message.
> 
> On Sun, Sep 11, 2016 at 5:10 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  It would be good to keep this information, and even add a link to [0]
>>
>> [0] http://lists.buildroot.org/pipermail/buildroot/2015-August/137580.html
> 
> Will do.
> 
> On Sun, Sep 11, 2016 at 5:10 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Actually, there is a 4.13 release now, so James, perhaps you should use that one?
> 
> Unless it's somewhere else, rpm.org's claim of release 4.13 was never
> completed [1]. The only 4.13 release made was a release candidate [2]
> (although I believe the Fedora team uses the RC; will probably
> additional distribution patches).

 I'm sorry, I just saw [1], didn't notice that the directory was empty.


 Regards,
 Arnout

> [1]: http://rpm.org/releases/rpm-4.13.x/
> [2]: http://rpm.org/releases/testing/
> [3]: http://pkgs.fedoraproject.org/cgit/rpms/rpm.git/tree/
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
