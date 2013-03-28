From: =?UTF-8?B?VGlsbWFuIEtlc2tpbsO2eg==?= <arved@arved.at>
Date: Thu, 28 Mar 2013 16:41:09 +0100
Subject: [Buildroot] [PATCH 4/4] Enable feature CONFIG_FEATURE_PIDFILE
 so that the syslog initscript actually works
In-Reply-To: <5154614A.6030806@mind.be>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
 <1364222893-23858-4-git-send-email-arved@arved.at> <5153ED66.3090001@mind.be>
 <51545AD6.5050307@arved.at> <5154614A.6030806@mind.be>
Message-ID: <51546495.2070307@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Arnout Vandecappelle [Thu, 28 Mar 2013 16:27:06 +0100]:
>> If you don't want to enable this feature, another option would be to use
>> start-stop-daemon -p in the syslog init script.
> 
>  It is already using the -p option, no?

Sorry, i meant -m, e.g. let start-stop-daemon handle the pidfile creation.



-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/12366c96/attachment.asc>
