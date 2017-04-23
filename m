From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 23:34:59 +0200
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
In-Reply-To: <20170420091731.3de60ee5@free-electrons.com>
References: <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
 <58f797c522aa7_548710f62c4102f@ultri3.mail>
 <20170420091731.3de60ee5@free-electrons.com>
Message-ID: <488de6bd-5014-59b4-100b-8a73e9343cb6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-04-17 09:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 19 Apr 2017 14:00:53 -0300, Ricardo Martincoski wrote:
> 
>>> On 14-04-17 01:44, Ricardo Martincoski wrote:  
>>>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>>>    automatic checker for coding style before submitting patches;
>>>>    It checks for a subset of the recommendation (e.g. file naming is not
>>>>    checked).  
>>>
>>>  For me, option D is great. It can also be added to the checkpackage script.  
>>
>> I can look into this integration.
> 
> I have nothing against option (D), but I'm wondering what is the
> relation with the checkpackage script. checkpackage checks packages,
> written in Kconfig and Make, what is the relation with complying with
> the Python PEP8 recommendation?

 Actually, check-package checks files, not packages. It looks at the filename
and if it is one it recognizes, it runs the appropriate checker on it. So a
checker that applies to files ending with .py could certainly be added.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
