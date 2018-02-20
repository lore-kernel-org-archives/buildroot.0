From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 20 Feb 2018 16:19:31 +0800
Subject: [Buildroot] [git commit branch/next] package/sqlite: bump
 version to 3220000 (3.22.0)
In-Reply-To: <87606sgk5b.fsf@dell.be.48ers.dk>
References: <20180205171736.A4FC381937@busybox.osuosl.org>
 <CAFkzVZZji+p+eXu=eU31_hUN2WdauwgmnYCoVoGge9sOW99gtQ@mail.gmail.com>
 <87606sgk5b.fsf@dell.be.48ers.dk>
Message-ID: <CAFkzVZaHPs4Vrmaa5CRu=7piAa0-eh5Q8f9Hpm4ie8zgLZttqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://sqlite.org/releaselog/3_22_0.html

Bug fixes:

   1. Infinite loop on an UPDATE that uses an OR operator in the WHERE
   clause. Problem introduced with 3.17.0 and reported on the mailing list
   about one year later. Ticket47b2581aa9bfecec
   <https://www.sqlite.org/src/info/47b2581aa9bfecec>.
   2. Incorrect query results when the skip-ahead-distinct optimization is
   used. Ticket ef9318757b152e3a
   <https://sqlite.org/src/info/ef9318757b152e3a>.
   3. Incorrect query results on a join with a ORDER BY DESC. Ticket
   123c9ba32130a6c9 <https://sqlite.org/src/info/123c9ba32130a6c9>.
   4. Inconsistent result set column names between CREATE TABLE AS and a
   simple SELECT. Ticket3b4450072511e621
   <https://sqlite.org/src/info/3b4450072511e621>
   5. Assertion fault when doing REPLACE on an index on an expression.
   Ticket dc3f932f5a147771 <https://sqlite.org/src/info/dc3f932f5a147771>
   6. Assertion fault when doing an IN operator on a constant index. Ticket
   aa98619ad08ddcab <https://sqlite.org/src/info/aa98619ad08ddcab>


2018?2?20? 16:06?"Peter Korsgaard" <peter@korsgaard.com>???

> >>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:
>
>  > Why was this committed in next ?
>  > Thanks
>
> Because we are past rc1. Does this fix any important issues making it a
> candidate for master?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180220/ce6f9d62/attachment.html>
