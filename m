From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 20:28:33 +0100
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 2.11.3
In-Reply-To: <20151122141122.4f03dc29@free-electrons.com>
References: <1448120479-7715-1-git-send-email-angelo.compagnucci@gmail.com>
 <20151122141122.4f03dc29@free-electrons.com>
Message-ID: <56521761.5010909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-11-15 14:11, Thomas Petazzoni wrote:
> Dear Angelo Compagnucci,
> 
> On Sat, 21 Nov 2015 16:41:19 +0100, Angelo Compagnucci wrote:
>> This patch bumps web2py version to 2.11.3
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  package/python-web2py/python-web2py.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
>> index 2991bb8..02c854d 100644
>> --- a/package/python-web2py/python-web2py.mk
>> +++ b/package/python-web2py/python-web2py.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -PYTHON_WEB2PY_VERSION = R-2.11.2
>> +PYTHON_WEB2PY_VERSION = R-2.11.3
>>  PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
>>  PYTHON_WEB2PY_LICENSE = LGPLv3
>>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE
> 
> The title of the commit was wrong: it's bumping python-web2py, not
> python-pydal. I've fixed that and applied to next.
> 
> Also, if you have time, please send a patch adding a hash file to this
> package, since github downloads are not assumed to provide stable
                                      ^^^now - essential difference here :-)

 Regards,
 Arnout

> tarballs.
> 
> Thanks,
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
