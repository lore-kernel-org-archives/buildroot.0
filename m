From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Nov 2016 23:43:07 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <CAMo8BfL07+NgrNjvFCC5H-6AzKqLPAqZDwppNDVFb77wT-z-GQ@mail.gmail.com>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
 <CAMo8BfL07+NgrNjvFCC5H-6AzKqLPAqZDwppNDVFb77wT-z-GQ@mail.gmail.com>
Message-ID: <f616926e-7b5c-6928-3b4c-89dfe1613374@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-11-16 00:14, Max Filippov wrote:
> On Wed, Nov 16, 2016 at 2:48 PM, Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
>> Do you see the issue described below? Maybe I am doing something wrong.
>> What bash version do you have in your RHEL5 servers?
> 
> Yes, I have this issue. It was introduced by the commit 20cd49738781b ("core:
> add support for multiple br2-external trees").

 Would any of you RHEL5 users be able to contribute an autobuilder instance so
this kind of issue can be detected on time?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
