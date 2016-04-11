From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Apr 2016 11:29:05 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <20160411091556.GP3364@tarshish>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411103211.3d9a1581@free-electrons.com> <570B6A67.1000806@mind.be>
 <20160411091556.GP3364@tarshish>
Message-ID: <570B6E61.4030403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/11/16 11:15, Baruch Siach wrote:
> Hi Arnout,
>
> On Mon, Apr 11, 2016 at 11:12:07AM +0200, Arnout Vandecappelle wrote:
>>   So, if python is used, please make sure it runs on any python (with full
>> standard library) from python2.4 (RHEL5) to python3.5. That means that using
>> the json standard library module is not an option, since it was introduced
>> only in python 2.6.
>
> The manual (http://nightly.buildroot.org/manual.html#requirement-mandatory)
> currently requires Python 2.6 or newer.

  I don't think that that's accurate. Thomas, Jan, I believe you're using RHEL5 
with an older python, no?

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
