From: Sean Perry <shaleh@speakeasy.net>
Date: Thu, 03 Jul 2008 14:40:27 -0700
Subject: [Buildroot] MySQL
In-Reply-To: <C780E22E-5C85-49A6-8B60-AC9E67CB236A@nebkom.co.za>
References: <C780E22E-5C85-49A6-8B60-AC9E67CB236A@nebkom.co.za>
Message-ID: <486D474B.4060803@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas Lane wrote:
> Hi everyone.
> 
> I've done a search on the buildroot mailing list, but found nothing on  
> MySQL?
> 
> Can it be done? Or do I need to convert to SQLite?
> 

If you need a "monster" database like MySQL why bother with uClibc? 
sqlite performs reasonably well, give it a spin. Multi-threaded access 
is probably your only real concern.
