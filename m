From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Jun 2008 09:35:52 +0200
Subject: [Buildroot] buildroot snapshot
References: <485C6383.8010806@ripnet.com><d6cda7730806231936n7211fd34h929fead0f5ef220a@mail.gmail.com>
	<48607D5C.2040002@ripnet.com>
Message-ID: <00d201c8d5d2$0328e7c0$0a0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike Sander wrote:
> Thiago A. Corr?a wrote:
>>> I guess I am looking for confirmation that the snapshot contains
>>> specific versions of packages and patches, and these same ones will
>>> be used even if the snapshot is run at a later date.
>>> 
>> 
>> Yes. Although sometimes packages vanish from their download sites for
>> whatever reason. In that case, you might be forced to bump versions
>> or update URLs in .mk files. That's unavoidable, unless you
>> save/mirror your download folder.
>> 
>> 
> Thank You for the confirmation.  Good point about specific bits
> disappearing.  I'll be sure to archive these.
> 
> As we move from development to production stability and repeatability
> become more critical.
> 
> I have also been thinking about this in the context of "what if one of
> my development boxes dies?" ... what do I need to do to get back to a
> working system.

Backups ;-)


If you are using a vanilla buildroot without modifications, you
can download the  latest svn or you can download a previous version
of buildroot (read subversion documentation to find out how)

It is highly unlikely that a default configuration will be OK for you.
You should write down which version of buildroot you are  using,
and you need to store somewhere the configuration you are using
and any modifications to the buildroot tree.

Periodically backing up the source tarballs may be helpful.

> 
> Regards,
> 
> Mike
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
>> AntiSpam:  SpamAssassin 3.2.3
>> by Markus Madlener @ http://www.copfilter.org
>> 
>> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Best Regards
Ulf Samuelsson
