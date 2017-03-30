From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 00:12:15 +0200
Subject: [Buildroot] [PATCH 01/21] docs/manual: refer to SPDX License
	List
In-Reply-To: <f50ef04f-f1ef-12b3-47cd-249d56dfafea@mind.be>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-2-git-send-email-rahulbedarkar89@gmail.com>
 <f50ef04f-f1ef-12b3-47cd-249d56dfafea@mind.be>
Message-ID: <11471d61-c0fd-541c-61a0-4eeebd22ca89@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 22:54, Arnout Vandecappelle wrote:
> 
> 
> On 30-03-17 15:43, Rahul Bedarkar wrote:
>> We want to use SPDX short identifier for license string as much as
>> possible. So refer to SPDX license list and use SPDX short identifier
>> for license strings in documentation.
>>
>> Also remove License abbreviations that we have.
>>
>> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
>> ---
>>  docs/manual/adding-packages-generic.txt       | 12 ++---
>>  docs/manual/adding-packages-kernel-module.txt |  4 +-
>>  docs/manual/adding-packages-perl.txt          |  2 +-
>>  docs/manual/adding-packages-python.txt        |  2 +-
>>  docs/manual/legal-notice.txt                  | 75 ---------------------------

 Oh, you missed one instance: docs/manual/contribute.txt still has a reference
to GPLv2 ("... under the Buildroot license (i.e. GPLv2, except for ...").

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
